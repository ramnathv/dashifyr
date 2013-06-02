// This output binding handles statusOutputBindings
var knobOutputBinding = new Shiny.OutputBinding();
$.extend(knobOutputBinding, {
  find: function(scope) {
    return scope.find('.knob_output');
  },
  renderValue: function(el, data) {
    if (!$(el).val()){
      $(el).knob()
    }
    $(el).val(data.val).trigger('change')
    $(el).trigger('configure', data.config)
  }
});
Shiny.outputBindings.register(knobOutputBinding, 'dashboard.knobOutputBinding');

function renderTemplate(sourceId, context){
  var source = $("#" + sourceId).html();
  var template = Handlebars.compile(source);
  return template(context)
}