( ( )=>{
  'use strict';

  angular
    .module( 'app') // module definition moved to head of html document

    .controller( 'ContentPaneController', ContentPaneController)

    .config( function( $stateProvider, $urlRouterProvider) {
      'use strict';

      // For any unmatched url, redirect to /state1
      $urlRouterProvider.otherwise( '/');

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
          },
          controller: 'MenuController',
          controllerAs: 'ctrl' })
        .state('loggedin.groups', {
          url: '/groups',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-group.html');
          }})

        .state('loggedin.matters', {
          url: '/matters',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-matters.html');
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
          controller: 'AdminGroupListController',
          controllerAs: 'ctrl',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-administration-groups.html');
          },
          resolve: {
            groupListData: [ 'Group', '$stateParams', '$q', ( Group, $stateParams, $q) => {
              let $promise = Group.find({});
              return $promise;
            }]}
        })
        .state('loggedin.administration.groups.add', {
          url: '/add',
          controller: 'AdminGroupAddController',
          controllerAs: 'ctrl',
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-administration-groups-add.html');
          }
        })
        .state('loggedin.administration.groups.edit', {
          url: '/edit/:groupId',
          controller: 'AdminGroupEditController',
          controllerAs: 'ctrl',
          resolve: {
            GroupData: [ 'Group', '$stateParams', '$q', ( Group, $stateParams, $q) => {
              let $promise = Group.findById({ id: $stateParams.groupId});
              return $promise;
            }]},
          templateProvider: function ( $templateCache) {
            return $templateCache.get( 'loggedin-administration-groups-edit.html');
          }})

        .state('loggedin.administration.companies', {
          url: '/companies',
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


  function ContentPaneController( ){
    this.model = {
      search: null
    };
  }

})( );


