`import Ember from 'ember'`
`import UnauthenticatedRouteMixin from 'simple-auth/mixins/unauthenticated-route-mixin'`

NewSessionRoute = Ember.Route.extend(UnauthenticatedRouteMixin, {
  setupController: (controller, model) ->
    @_super.apply(@, arguments)

    # forces the loginFailed flag to false upon entering the route
    # this is done so that the failure state is not kept across
    # page transitions
    controller.set('loginFailed', false)
})

`export default NewSessionRoute`
