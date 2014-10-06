`import DS from 'ember-data'`

# tell ember-data that this application is talking to Rails
# all store.find() calls will go to /api/v1/<model>
ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api/v1'
})

`export default ApplicationAdapter`
