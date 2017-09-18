var app = new Vue({
    el: '#app',
    data: {
        items: [],
        search: '',
        sort: '',
        links: '',
        page: '/api/v1/index',
        options: [
            'Name',
            'Author'
        ]
    },
    created: function () {
        this.fetchData();
    },
    methods: {
        changePage: function(page){
            this.page = page;
        },
        fetchData: function () {
            this.$http.get('/api/v1/index').then(function(response){
                console.log(JSON.stringify(response.data));
                this.items = response.data.data;
                this.links = response.data.links;
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
                    if (a.attributes.author < b.attributes.author)
                        return -1;

                    if (a.attributes.author > b.attributes.author)
                        return 1;

                    return 0;
                });
            } else {
                return list;
            }
        }
    }
})