( ( )=>{
  'use strict';

  angular
    .module( 'app', [
      'ngResource',
      'ui.router',
      'KeyCloak',
      'lbServices'
    ])

    .controller( 'LayoutController', LayoutController)
    .controller( 'ContentPaneController', ContentPaneController)

    .config( function( $stateProvider, $urlRouterProvider) {
      'use strict';
      //
      // For any unmatched url, redirect to /state1
      $urlRouterProvider.otherwise( '/' );

      $stateProvider
        .state('loggedout', {
          url: '/',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedout-main.html');
          }})
        .state('loggedin', {
          url: '/main',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-main.html');
          }})
        .state('loggedin.groups', {
          url: '/groups',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-group.html');
          }})
        .state('loggedin.timesheet', {
          url: '/timesheet',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-timesheet.html');
          }})
        .state('loggedin.administration', {
          url: '/administration',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-administration.html');
          }})
        .state('loggedin.administration.groups', {
          url: '/groups',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-administration-groups.html');
          }})
        .state('loggedin.administration.companies', {
          url: '/groups',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-administration-companies.html');
          }})
        .state('loggedin.administration.employees', {
          url: '/employees',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-administration-employees.html');
          }})
        .state('loggedin.administration.templates', {
          url: '/templates',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-administration-templates.html');
          }})
        .state('loggedin.user', {
          url: '/user',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-user.html');
          }})
        .state('loggedin.profile', {
          url: '/profile',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-profile.html');
          }})
      ;
    })
  ;

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


  function ContentPaneController( ){
    this.model = {
      search: null
    };
  }

})( );


