/*
 * jquery.fancyspinbox.js
 * version 0.1.0
 * (c) 2015 Maya Kokits
 * License: MIT
 */
;(function ( $, window, document, undefined ) {
	'use strict';
	
	var instCount = 0;	// plugin instance counter
	
  // Detect transition support - thanks to @viljamis
  var supportsTransitions = (function () {
    var docBody = document.body || document.documentElement;
    var styles = docBody.style;
    var prop = "transition";
    if (typeof styles[prop] === "string") {
      return true;
    }
    // Tests for vendor specific prop
    var vendor = ["Moz", "Webkit", "Khtml", "O", "ms"];
    prop = prop.charAt(0).toUpperCase() + prop.substr(1);
    var i;
    for (i = 0; i < vendor.length; i++) {
      if (typeof styles[vendor[i] + prop] === "string") {
        return true;
      }
    }
    return false;
  })();

	// this is the constructor for the plugin object
	var Fancyspinbox = function(origSelect, options){
		
		// private variables
		
		var $origSelect = $(origSelect), // original select element
			$fancy,				// fancyspinbox element
			$items,				// the children of .crop ul 
			obj = this,		// the plugin object
			id,						// unique id per element, ie. fancy-spinbox-3
			selected = 0,	// selected index
			spinboxHeight,
			dropdownOpen = false;
			
		// Merge options with defaults
		var settings = $.extend({
				"items": [],								// An array of items to add to the list on initialisation. Items can be strings or objects like {"value": "foo", "text": "bar"}
				"spinButtons": true,				// Display spin buttons.
				"dropdownButton": false,		// Display a dropdown button. Overrides the spinButtons option and sets dropdown to true.
				"dropdown": true,						// Display the dropdown. 
				"cycle": false,							// Cycle through the items, don't stop at the end.
				"scroll": true,							// Animate the spinbox.
				"scrollDuration": 300,			// Duration of the scroll transition.
				"flipSpinDirection": false,	// Flip the spin button's direction.
				"focusOnSpin": false				// Give focus to the spinbox if a spin button is clicked 
			}, options || {});
			
		if (settings.dropdownButton || (!settings.dropdownButton && !settings.spinButtons)) settings.dropdown = true;
		
		
			
		// public methods
		
		this.up = function(){
			if ( selected < (origSelect.options.length - 1) ) {
				selected++;
			} else {
				if ( settings.cycle ) selected = 0; else return false;
			}
			updateSelected();
			return selected;
		};
		
		this.down = function(){
			if ( selected > 0 ) {
				selected--;
			} else {
				if ( settings.cycle ) selected = origSelect.options.length - 1; else return false;
			}
			updateSelected();
			return selected;
		};
		
		this.select = function(i){
			if (i >= 0 && i < origSelect.options.length) {
				selected = i;
				updateSelected();
				return true;
			} else {
				return false;
			}
		};
		
		this.add = function(text, value){
			if(text === undefined) return;
			var option, content, li, $li;
			// add the option to the origSelect
			option = document.createElement("option");
			content = document.createTextNode(text.toString());
			option.appendChild(content);
			if (value !== undefined) {
				option.setAttribute("value", value.toString());
			}
			origSelect.appendChild(option);
			// add the option to $fancy
			li = document.createElement("li");
			li.innerHTML = text.toString();
			$li = $(li);
			$li
				.appendTo($fancy.find("ul.dropdown"))
				.clone()
				.attr({
						"role": "option",
						"id": id + "-option-" + ( origSelect.options.length - 1 )
					})
				.appendTo($fancy.find(".crop ul"));
			// keep $items up to date
			$items = $items.add($li);
		};
		
		
		// private methods
		
		var init = (function(){
				id = "fancy-spinbox-" + instCount++;
				
				$fancy = $origSelect.clone();
				$items = $fancy.find("option").changeElementType("li");
				
				// use the data-text attribute if there is one, and get preselected items
				$items.each(function(i){
					var markup = this.getAttribute("data-text");
					if (markup) {
						this.innerHTML = markup;
					
						// strip scripts... thanks to RobG
						var scripts = this.getElementsByTagName('script');
				    var j = scripts.length;
				    while (j--) {
				      scripts[j].parentNode.removeChild(scripts[j]);
				    }
					}
					
					if (this.getAttribute("selected")) selected = i;
					this.removeAttribute("selected");	
					this.removeAttribute("value");
				});
				$items.eq(selected).addClass("selected");
				
				// we need tabindex to make our spinbox focusable.
				// is there already a tabindex attribute?
				var tabIndex = $fancy.attr("tabindex");
				// if not, give our spinbox the tabindex 0
				if (!tabIndex) tabIndex = 0;
				
				$fancy
					.changeElementType("div")
					.attr({
							"id": (origSelect.id) ? origSelect.id + "-fancy" : "", 
							"tabindex": tabIndex,
							"role": "combobox",
							"aria-expanded": "false",
							"aria-autocomplete": "list",
							"aria-owns": id + "-list",
							"aria-activedescendant": id + "-option-" + selected
						})
					.addClass("fancy-spinbox " + id)
					.empty()
					.append(
						 $("<div/>", {
								"class": "crop",
							}).append( $("<ul/>", {
									"role": "listbox", 
									"aria-hidden": "true",
									"id": id + "-list"
								}).append( $items )
							)
						);
				
				if (settings.dropdown) {
					$fancy
						.attr({
								"aria-haspopup": "true",
							})
						.append( 
							$("<ul/>", {
									"class": "dropdown",
									"aria-hidden": "true"
								}).append( $items.clone() )
							);							
				} else {
					$fancy.attr({
							"aria-haspopup": "false",
						});
				}
				
				// add the items passed as an option
				// settings.items could be an array of objects {"value": "foo", "text": "bar"} or strings
				for(var i=0,j=settings.items.length; i<j; i++){
					if (typeof settings.items[i] === "string") {
						obj.add(settings.items[i]);
					} else if (settings.items[i].text || settings.items[i].value) {
						obj.add( (settings.items[i].text || ""), settings.items[i].value );
					}
				};
				
				// add aria role "option" to all the items
				$fancy.find(".crop li").each(function(i){
					this.setAttribute("role", "option");
					this.setAttribute("id", id + "-option-" + i);
				});
				
				// buttons markup
				var buttonMarkup = (settings.dropdownButton) ? '<button class="toggle-dropdown" tabindex="-1"><span class="triangle-down"></span></button>'
					: '<button class="spin-up" tabindex="-1"><span class="triangle-up"></span></button><button class="spin-down" tabindex="-1"><span class="triangle-down"></span></button>';
				if ( settings.spinButtons || settings.dropdownButton ) {
					$fancy.append('<div class="buttons">' + buttonMarkup + '</div>');
				} else {
					$fancy.css({"padding-right": "0"});
				}
				
				// insert $fancy into the DOM
				$origSelect.hide().after($fancy);
				
				// save the new element for the plugin wrapper
				obj.element = $fancy;
				
				// get the height of the spinbox and shift the selected element into view
				spinboxHeight = $fancy.innerHeight();
				var $croppedList = $fancy.find(".crop ul").css({"margin-top": spinboxHeight * selected * -1});
				if (settings.scroll) $croppedList.css({"transition": "margin-top " + settings.scrollDuration + "ms ease"});
				
				// event handlers
				$fancy.find(".spin-up").on("mousedown", function(e){
						e.preventDefault();
						if (!settings.flipSpinDirection) obj.down(); else obj.up();
						if (settings.focusOnSpin) $fancy.focus();
					});
				$fancy.find(".spin-down").on("mousedown", function(e){
						e.preventDefault();
						if (!settings.flipSpinDirection) obj.up(); else obj.down();
						if (settings.focusOnSpin) $fancy.focus();
					});
				$fancy.find(".crop").add("button.toggle-dropdown", $fancy).on("mousedown", function(e){
						e.preventDefault();
						toggleDropdown();
						if (dropdownOpen) $fancy.focus(); // so that we can catch the blur event
					});
				$fancy.on("blur", function(){
						if (dropdownOpen) toggleDropdown();
					});
				$fancy.delegate(".dropdown li", "click", function(e){
					selected = $(this).index();
					toggleDropdown();
					updateSelected();
				});
				$fancy.on("keydown", function(e){
					switch (e.which) {
						case 32:	// Space - don't scroll the document
							e.preventDefault();
						case 13:	// Enter
							toggleDropdown();
							break;
						case 38:	// Up - don't scroll the document
							e.preventDefault();
						case 37:	// Left
							if (!settings.flipSpinDirection) obj.down(); else obj.up();
							break;
						case 40:	// Down - don't scroll the document
							e.preventDefault();
						case 39:	// Right
							if (!settings.flipSpinDirection) obj.up(); else obj.down();
							break;
						case 36:	// Home
							selected = 0;
							updateSelected();
							break;
						case 35:	// End
							selected = origSelect.options.length - 1;
							updateSelected();
							break;
						case 27:	// Esc
							if (dropdownOpen) toggleDropdown();
							break;
					}
					if ((48 <= e.which) && (e.which <= 90)) {	// 0-9, A-Z
						// get the character
						var character = String.fromCharCode(e.which).toLowerCase();
						var startWith = 0;
						// if the currently selected item begins with the character, find the next one
						if ($items[selected].textContent.substr(0, 1).toLowerCase() == character) startWith = selected + 1;
						// go through the items
						for(var i=startWith,j=$items.length; i<j; i++){
							if ($items[i].textContent.substr(0, 1).toLowerCase() == character) {
								selected = i;
								updateSelected();
								return;
							}
						}
						// if we did not find anything at the end of the list, start over again
						for(var i=0,j=startWith; i<j; i++){
							if ($items[i].textContent.substr(0, 1).toLowerCase() == character) {
								selected = i;
								updateSelected();
								return;
							}
						}
					}
				});
				$origSelect.on("change", function(e){
					if (selected == origSelect.selectedIndex) return;
					selected = origSelect.selectedIndex;
					updateSelected();
				});
				
			})(),
			
			toggleDropdown = function(){
				if (!settings.dropdown) return;
				if (dropdownOpen) {
					dropdownOpen = false;
					$fancy.find(".crop ul").attr({
							"aria-hidden": "true"
						});
					$fancy.find(".dropdown").css({
							"left": "-9999px",
						});
				} else {
					dropdownOpen = true;
					$fancy.find(".crop ul").attr({
							"aria-hidden": "false"
						});
					$fancy.find(".dropdown").css({
							"left": "-" + $fancy.css("border-left-width"),
							"width": $fancy.innerWidth()
						});
				}
			},
			
			updateSelected = function(){
				if (supportsTransitions || !settings.scroll) {
					$fancy.find(".crop ul").css({"margin-top": spinboxHeight * selected * -1});
				} else {
					$fancy.find(".crop ul").animate({"margin-top": spinboxHeight * selected * -1}, settings.scrollDuration);
				}
				$fancy.find("li.selected").removeClass("selected");
				$fancy.find(".crop li:eq(" + selected + ")").add(".dropdown li:eq(" + selected + ")", $fancy).addClass("selected");
				origSelect.selectedIndex = selected;
				$fancy.attr({"aria-activedescendant": id + "-option-" + selected});
				// trigger onchange on the original select element in case someone listens
				$origSelect.trigger("change");
			};
		
	};
	
	// Plugin wrapper function
	$.fn.fancyspinbox = function(options){
		for(var i=0,j=this.length; i<j; i++){
			
			// Return early if this element already has a plugin instance
			if ($.data(this[i], 'fancyspinbox')) return;
			
			// Instanciate the plugin
			var fancyspinbox = new Fancyspinbox(this[i], options);

			// Store plugin object in this element's data
			$.data(this[i], 'fancyspinbox', fancyspinbox);

		};
		return this;
		
	};
	
	
	// helper plugins
	
	// thanks to Etienne Desautels
	$.fn.changeElementType = function(newType) {

		for (var i=0, j=this.length; i<j; i++) {
			var attrs = {}, $new;

			$.each(this[i].attributes, function(idx, attr) {
				attrs[attr.name] = attr.value;
			});

			$new = $("<" + newType + "/>", attrs).append($(this[i]).contents());
			$(this[i]).replaceWith( $new );
			
			// save the new element
			this[i] = $new[0];

		}

		// return the collection
		return this;
	};

})( jQuery, window, document );
