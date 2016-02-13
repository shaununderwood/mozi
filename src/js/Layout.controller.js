(( )=>{
  'use strict';

  function LayoutController( $scope, $state, $rootScope, KeyCloakService){
    let vm = this;
    vm.KeyCloakService = KeyCloakService;
    vm.$state = $state;
    vm.$rootScope = $rootScope;
  }

  LayoutController.prototype.initKeyCloak = function initKeyCloak( ){
    let vm = this;
    vm.KeyCloakService.initialise( );
  };

  LayoutController.prototype.logout = function initKeyCloak( ){
    let vm = this;
    vm.$rootScope.userLogout( );
  };

  LayoutController.prototype.gotoState = function gotoState( state){
    let vm = this;
    vm.$state.go( state);
  };


  let app = angular.module( 'app');
  app.controller( 'LayoutController', LayoutController);

})( );