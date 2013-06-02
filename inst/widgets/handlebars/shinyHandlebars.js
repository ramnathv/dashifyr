// This output binding handles statusOutputBindings
var handlebarsOutputBinding = new Shiny.OutputBinding();
$.extend(handlebarsOutputBinding, {
  find: function(scope) {
    return scope.find('.handlebars_output');
  },
  renderValue: function(el, data) {
    var sourceId = $(el).data('tid');
    $(el).html(renderTemplate(sourceId, data))
  }
});
Shiny.outputBindings.register(handlebarsOutputBinding, 'dashboard.handleBarsOutputBinding');

function renderTemplate(sourceId, context){
  var source = $("#" + sourceId).html();
  var template = Handlebars.compile(source);
  return template(context)
}