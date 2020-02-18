###Comando para rodar
mvn test -DargLine="-Dkarate.env='qa'" -Dkarate.options="--tags @test" -Dtest=claroApp.authentication.update.CheckUpdateRunner

-Dkarate.env pode ser local, dev ou qa

-Dkarate.options pode colocar tags para rodar somente as tags ou ignorar algumas tags

-Dtest o runner do microserviço que quer testar