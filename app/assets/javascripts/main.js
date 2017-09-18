var app = new Vue({
    el: '#app',
    data: {
        items: [],
        search: '',
        sort: '',
        options: [
            'Name',
            'Author'
        ]
    },
    created: function () {
        this.fetchData();
    },
    methods: {
        fetchData: function () {
            this.$http.get("/api/v1/index").then(function(response){
                console.log(response.data)
                this.items = response.data.data
            }, function(){
                alert("error")
            });
        }
    },
    computed: {
        filteredList: function() {
            search = this.search
            var list = this.items.filter(function (item) {
                var name = item.attributes.name.toLowerCase().includes(search.toLowerCase());
                console.log(search)
                return name
            });
            if (this.sort == 'author') {
                return list.sort(function(a, b) {
                    if (a.attributes.author < b.attributes.author){
                        return -1;
                    }
                    if (a.attributes.author > b.attributes.author){
                        return 1;
                    }
                    return 0;
                });
            } else {
                return list;
            }
        }
    }
})