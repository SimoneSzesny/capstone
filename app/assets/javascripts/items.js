/* global Vue, $ */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      message: 'Hello Vue!',
      items: [],
      colors: [],
      styles: [],
      tests: [1, 2]
    },
    mounted: function() {
      $.get("/api/v1/items", function(responseData) {
        this.items = responseData;
        console.log(this.items);
      }.bind(this));
      $.get("/api/v1/styles", function(responseData) {
        this.styles = responseData;
        console.log(this.styles);
      }.bind(this));
      $.get("/api/v1/colors", function(responseData) {
        this.colors = responseData;
        console.log(this.colors);
      }.bind(this));
    },
    computed: {
      modifiedItems: function() {
        var items = this.items;

        var selectedColorIds = this.colors
          .filter(color => color.selected)
          .map(color => color.id);
        if (selectedColorIds.length > 0) {
          items = items.filter(item => selectedColorIds.includes(item.color.id));
        }

        var selectedStyleIds = this.styles
          .filter(style => style.selected)
          .map(style => style.id);
        if (selectedStyleIds.length > 0) {
          items = items.filter(item => selectedStyleIds.includes(item.style.id));
        }

        console.log('the selected style ids are', selectedStyleIds);



        console.log('the selected color ids are', selectedColorIds);
        return items;
      }
    },
    methods: {
      itemUrl: function(id) {
        url = "/items/" + id;
        // url = "/#item-" + id;
        return url
      }
    }
  });
});