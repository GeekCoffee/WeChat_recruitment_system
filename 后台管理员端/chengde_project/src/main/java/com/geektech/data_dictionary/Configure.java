package com.geektech.data_dictionary;

public class Configure {

    private static final String key = "NZAx9tTdmbd9pQHnHDRuXVFkELMJz8oS"; //商户API密钥

    private static final String appid = "wx7ffc14ae576504de";

    private static final String secrct = "df12a0e224c477e449e481b4ce9a2f2c";

    private static final String grant_type = "client_credential";
	
	private static final String gran_type_jscode = "authorization_code";

    private static final String template_id_return = "0_Bl8ft1q1Jo9T12tGkM9gXs-emaDzJ8yQsbDFvGZg0";

    private static final String template_id_resevation = "T3nWvWiEUg32rKNyKNp02l0nYfnao84vuGBZF_7QQK0";

    private static final String mch_id = "1457540002";

    private static final String geektechBase = "http://localhost/chengde_project/";

    public static String getGeektechBase() {
        return geektechBase;
    }

    public static String getGran_type_jscode() {
        return gran_type_jscode;
    }

    public static String getAppid() {
        return appid;
    }

    public static String getSecrct() {
        return secrct;
    }

    public static String getGrant_type() {
        return grant_type;
    }

    public static String getTemplate_id_return() {
        return template_id_return;
    }

    public static String getTemplate_id_resevation() {
        return template_id_resevation;
    }

    public static String getMch_id() {
        return mch_id;
    }

    public static String getKey() {
        return key;
    }

}
