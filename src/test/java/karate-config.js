function() {
    var env = karate.env
    var config = { };

  if (!env) {
    env = 'local';
  }


  switch (env) {
    case 'local':
        config.ageUrl = 'http://localhost:8030/api/v1/chronos/'
        config.logondefault = 'HOM04832'
        break;
    case 'dev':
        config.authenticationUrl = 'https://dev-gw.claro.com.br/authentication/v1/'
        config.franchiseUrl = 'https://dev-gw.claro.com.br/usage-consumption/v1/broadband-cap/routers/'
        config.ombudsmanUrl = 'https://dev-gw.claro.com.br/trouble-ticket/v1/'
        config.inventoryUrl = 'https://dev-gw.claro.com.br/resource-inventory/v1/'
        config.portabilityUrl = 'https://dev-gw.claro.com.br/resource-order-portability/v1/'
        config.piracyUrl = 'https://dev-gw.claro.com.br/communication/v1/'
        config.userUrl = 'https://dev-gw.claro.com.br/user/v1/'
        config.financialUrl = 'https://dev-gw.claro.com.br/financial/v1/'
        config.financialzupUrl = 'https://dev-gw.claro.com.br/financial/v1/'
        config.technicianzupUrl = 'https://dev-gw.claro.com.br/technician/v1/'
        config.technicianUrl = 'https://dev-gw.claro.com.br/technician/v1/'
        config.technicianv2Url = 'https://dev-gw.claro.com.br/technician/v2/'
        config.securityUrl = 'https://dev-gw.claro.com.br/security/v1/'
        config.deviceUrl = 'https://dev-gw.claro.com.br/resource-inventory/v1/'
        config.gwappkey = 'e9e24b40c78e013762d7000d3ac06d76'
        config.xappkey = '2251d8c0a94601364c54000d3ac06d76'
        config.password =  '@Nowauto'
        config.document = '46168907734'
        config.username = '46168907734'
        config.partneraccountkey = 'WmZq4t7w!z%C&F)J'
        config.partneraccount = 'NETAPPNOVO'
        config.contractnumber = '112778101'
        config.contractnumberuno = '200011019'
        config.city = '05509'
        config.operatorcode = '003'
        config.node = 'F107'
        config.codimovel = '366130821'
        config.product = 'VIRTUA 35M EXCL BASE UP BLIND FID'
        config.mac = 'BC644BBFCE92'
        config.deviceId = 'ZDA6YzU6ZjM6NGU6OGY6OTU='
        config.userinfouno = 'ahLJVg2FzLA5R1tdLjWPtUmrgA9EZ49dHQQ9vY4FZZxfc4yre7zj+I+o4cMHwZIjVNxt52rONNv3NN7rXy52+0qKmuMrAdzL1pzE6wZ/+iPOaFJ3g4AOLvCBj0CfWRiVCuOIicFgFxAzodCnpbNVJiMkNJ6Lv50eD1rRZxVZiAE81LM3QojETG8j1vnANHgFHvBFG8GjqSewkWa3UH5NJSe5cpGpNg6PKhnxzihIei31A2PzLo1yZo391gTqetQaZOVF3x2L0QuvhbnmnnX47Ki/my0p5XG9RdMqb6M7bi2Ft0Lg9ZDTvJGGKBUfpVbvUe/+6ahDLIKw6ReFRI57EBw+zZmdPNWDye6NFwVLVG6Mk1iNNpCe62gin2OPIWm370l9lo35foABDe2WSz1g614dQdLXZ7DJ13AgTtcTOJM83T8NJaZG1miQ41qD7ZjfcX0IYZU7HqJs8jDYFvFuiCKkpOGvE24cGnEazUAzUno='
        break;
    case 'qa':
        config.authenticationUrl = 'https://qa-gw.claro.com.br/authentication/v1/'
        config.franchiseUrl = 'https://qa-gw.claro.com.br/usage-consumption/v1/broadband-cap/routers/'
        config.ombudsmanUrl = 'https://qa-gw.claro.com.br/trouble-ticket/v1/'
        config.inventoryUrl = 'https://qa-gw.claro.com.br/resource-inventory/v1/'
        config.piracyUrl = 'https://qa-gw.claro.com.br/communication/v1/'
        config.portabilityUrl = 'https://qa-gw.claro.com.br/resource-order-portability/v1/'
        config.userUrl = 'https://qa-gw.claro.com.br/user/v1/'
        config.financialUrl = 'https://qa-gw.claro.com.br/financial/v1/'
        config.financialzupUrl = 'https://qa-gw.claro.com.br/financial/v1/'
        config.technicianzupUrl = 'https://qa-gw.claro.com.br/technician/v1/'
        config.technicianUrl = 'https://qa-gw.claro.com.br/technician/v1/'
        config.technicianv2Url = 'https://qa-gw.claro.com.br/technician/v2/'
        config.securityUrl = 'https://qa-gw.claro.com.br/security/v1/'
        config.deviceUrl = 'https://qa-gw.claro.com.br/resource-inventory/v1/'
        config.gwappkey = 'e9e24b40c78e013762d7000d3ac06d76'
        config.xappkey = '2251d8c0a94601364c54000d3ac06d76'
        config.password =  'Net.123'
        config.document = 'Net.web'
        config.username = '36512468848'
        config.partneraccountkey = 'WmZq4t7w!z%C&F)J'
        config.partneraccount = 'NETAPPNOVO'
        config.contractnumber = '019181308'
        config.contractnumberuno = '200011019'
        config.city = '05509'
        config.operatorcode = '052'
        config.node = 'F107'
        config.codimovel = '366130821'
        config.product = 'VIRTUA 35M EXCL BASE UP BLIND FID'
        config.mac = '6CB56B7C5586'
        config.deviceId = 'ZDA6YzU6ZjM6NGU6OGY6OTU='
        config.userinfouno = 'ahLJVg2FzLA5R1tdLjWPtUmrgA9EZ49dHQQ9vY4FZZxfc4yre7zj+I+o4cMHwZIjVNxt52rONNv3NN7rXy52+0qKmuMrAdzL1pzE6wZ/+iPOaFJ3g4AOLvCBj0CfWRiVCuOIicFgFxAzodCnpbNVJiMkNJ6Lv50eD1rRZxVZiAE81LM3QojETG8j1vnANHgFHvBFG8GjqSewkWa3UH5NJSe5cpGpNg6PKhnxzihIei31A2PzLo1yZo391gTqetQaZOVF3x2L0QuvhbnmnnX47Ki/my0p5XG9RdMqb6M7bi2Ft0Lg9ZDTvJGGKBUfpVbvUe/+6ahDLIKw6ReFRI57EBw+zZmdPNWDye6NFwVLVG6Mk1iNNpCe62gin2OPIWm370l9lo35foABDe2WSz1g614dQdLXZ7DJ13AgTtcTOJM83T8NJaZG1miQ41qD7ZjfcX0IYZU7HqJs8jDYFvFuiCKkpOGvE24cGnEazUAzUno='
        break;
     case 'prod':
        config.authenticationUrl = 'https://prd-gw.claro.com.br/authentication/v1/'
        config.franchiseUrl = 'https://prd-gw.claro.com.br/usage-consumption/v1/broadband-cap/routers/'
        config.ombudsmanUrl = 'https://prd-gw.claro.com.br/trouble-ticket/v1/'
        config.inventoryUrl = 'https://prd-gw.claro.com.br/resource-inventory/v1/'
        config.portabilityUrl = 'https://prd-gw.claro.com.br/resource-order-portability/v1/'
        config.userUrl = 'https://prd-gw.claro.com.br/user/v1/'
        config.financialUrl = 'https://prd-gw.claro.com.br/financial/v1/'
        config.financialzupUrl = 'https://claro.gateway.zup.me/financial/v1/'
        config.technicianzupUrl = 'https://claro.gateway.zup.me/technician/v1/'
        config.technicianUrl = 'https://prd-gw.claro.com.br/technician/v1/'
        config.technicianv2Url = 'https://prd-gw.claro.com.br/technician/v2/'
        config.securityUrl = 'https://prd-gw.claro.com.br/security/v1/'
        config.gwappkey = '2251d8c0a94601364c54000d3ac06d76'
        config.xappkey = '2251d8c0a94601364c54000d3ac06d76'
        config.password =  'Net.321'
        config.document = '36512468848'
        config.username = '36512468848'
        config.partneraccountkey = 'WmZq4t7w!z%C&F)J'
        config.partneraccount = 'NETAPPNOVO'
        config.contractnumber = '019181308'
        config.contractnumberuno = '200011019'
        config.city = '05509'
        config.operatorcode = '052'
        config.node = 'F107'
        config.codimovel = '366130821'
        config.product = 'VIRTUA 35M EXCL BASE UP BLIND FID'
        config.mac = '6CB56B7C5586'
        config.deviceId = 'ZDA6YzU6ZjM6NGU6OGY6OTU='
        config.userinfouno = 'ahLJVg2FzLA5R1tdLjWPtUmrgA9EZ49dHQQ9vY4FZZxfc4yre7zj+I+o4cMHwZIjVNxt52rONNv3NN7rXy52+0qKmuMrAdzL1pzE6wZ/+iPOaFJ3g4AOLvCBj0CfWRiVCuOIicFgFxAzodCnpbNVJiMkNJ6Lv50eD1rRZxVZiAE81LM3QojETG8j1vnANHgFHvBFG8GjqSewkWa3UH5NJSe5cpGpNg6PKhnxzihIei31A2PzLo1yZo391gTqetQaZOVF3x2L0QuvhbnmnnX47Ki/my0p5XG9RdMqb6M7bi2Ft0Lg9ZDTvJGGKBUfpVbvUe/+6ahDLIKw6ReFRI57EBw+zZmdPNWDye6NFwVLVG6Mk1iNNpCe62gin2OPIWm370l9lo35foABDe2WSz1g614dQdLXZ7DJ13AgTtcTOJM83T8NJaZG1miQ41qD7ZjfcX0IYZU7HqJs8jDYFvFuiCKkpOGvE24cGnEazUAzUno='
        break;
  }
  karate.configure('connectTimeout', 120000);
  karate.configure('readTimeout', 120000);

  return config;
}