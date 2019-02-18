var posts = new Vue({
    el: '#posts',
    data: {
      posts: []
    },
    ready: function() {
      var that;
      that = this;
      $.ajax({
        url: '/posts.json',
        success: function(res) {
          that.posts = res;
        }
      });
    }
  });
  Vue.component('post-row', {
    template: '#post-row',
    props: {
      post: Object
    }
  })
  