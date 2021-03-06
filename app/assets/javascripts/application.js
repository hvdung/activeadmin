// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require jquery-ui
//= require popper
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require ckeditor/init

$(document).on("turbolinks:load", function() {
      $( "#search-field" ).autocomplete({
        source: function (request, response) {
          $.getJSON("/posts.json?search_content=" + request.term, function (data) {
              response($.map(data.posts, function (value, key) {
                  return {
                      label: value.title,
                      value: key,
                      id: value.id,
                      image: value.image
                  };
              }));
          });
      },
      minLength: 2,
      delay: 100,
      }).data("ui-autocomplete")._renderItem = function(ul, item){
        if(!item.image){
            var thumb = "placeholder.it";
        }
        else{
            var thumb = item.image;
        }
        var markup = [
            "<span>" + thumb + "</span>",
            "<span>" + item.label + "</span>",
        ]
        return $( "<li>" )
            .data( "item.autocomplete", item )
            .append( markup.join('') )
            .appendTo( ul );
      };
      
});
