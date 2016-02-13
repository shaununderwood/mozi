'use strict';

angular
  .module( 'app', [
    'ngResource',
    'ui.router',
    'KeyCloak',
    'lbServices'
  ]);

var keycloak = Keycloak('http://localhost:8001/keycloak.json');

keycloak
  .init({
    onLoad: 'login-required'
  })
  .success(function ( result) {
    //User has logged in
    keycloak
      .loadUserInfo( )
      .success( function ( userInfo) {
        // Bootstrap Angular
        bootstrapAngular(keycloak, userInfo );
      });
  });

function bootstrapAngular( keyCloak, userInfo) {

  let KeyCloakService = ( function (keyCloak){
    return function( ){
      return keyCloak;
    }; })( keyCloak);

  angular
    .module( 'app')
    .constant( 'CurrentUser', {
      keyCloak: keyCloak,
      userInfo: userInfo
    })
    .service( 'KeyCloakService', KeyCloakService)
    .run( function ( $rootScope) {

      $rootScope.userLogout = function () {
        keycloak.logout();
      };

      $rootScope.isManager = ()=>{
        return keycloak.realmAccess.roles.includes('manager');
      };

      $rootScope.isAssociate = ()=>{
        return !keycloak.realmAccess.roles.includes('manager') && keycloak.realmAccess.roles.includes('associate');
      };


    });
  angular.bootstrap(document, ['app']);
}
