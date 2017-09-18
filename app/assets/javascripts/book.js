
var app = new Vue({
    el: '#app',
    data: {
        item: []
    },
    created: function () {
        this.fetchData();
    },
    methods: {
        fetchData: function () {
            url = "/api/v1" + window.location.pathname;
            this.$http.get(url).then(function(response){
                console.log(JSON.stringify(response.data));
                this.item = response.data.data.attributes;
            }, function(){
                alert("error")
            });
        }
    }
})