( ( ) => {
  'use strict';

  angular
    .module( 'KeyCloak', [ ])

    .constant( 'KeyCloakSetupFile', 'http://localhost:8001/keycloak.json')

    .config( ( ) => {

    })

    .service( 'KeyCloakService', KeyCloakService)
  ;

  function KeyCloakService( $window, KeyCloakSetupFile){
    let s = this;
    s.$window = $window;
    s.KeyCloakSetupFile = KeyCloakSetupFile;
    s.auth = { };
  }

  KeyCloakService.prototype.initialise = function initialise( ){
    let s = this;
    s.auth.loggedIn = false;

    let keycloakAuth = new Keycloak( s.KeyCloakSetupFile);
    let keyCloakResult = keycloakAuth.init( { onLoad: 'login-required' } );
    keyCloakResult
      .success( ( authenticated) => {
        alert('success');
        auth.loggedIn = true;
        auth.authz = keycloakAuth;
        auth.logoutUrl = keycloakAuth.authServerUrl + "/realms/"+keycloakAuth.realm+"/tokens/logout?redirect_uri=/";
        module.factory( 'Auth', function( ) {
          return auth;
        });
      })
      .error( ( ) => {
        alert( 'failed to initialize');
      });
  };

  KeyCloakService.prototype.logout = function logout( ){
    let s = this;
    console.log('*** LOGOUT');
    s.auth.loggedIn = false;
    s.auth.authz = null;
    s.$window.location = s.auth.logoutUrl;
  };

})( );