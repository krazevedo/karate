package backend;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;

public class DecodeJWT {
    public String getContract(String token) {
        DecodedJWT decoded = JWT.decode(token);
        String contract = decoded.getClaim("contrato").asString();
        return contract;
    }

    public String getOperatorCode(String token) {
        DecodedJWT decoded = JWT.decode(token);
        String operator = decoded.getClaim("codigoOperadora").asString();
        return operator;
    }

    public String getPartner(String token) {
        DecodedJWT decoded = JWT.decode(token);
        String partner = decoded.getClaim("partnerAccount").asString();
        return partner;
    }
}
