var app = new Vue({
    el: '#app',
    data: {
        items: [],
        search: '',
        sortKey: 'name',
        reverse: 1,
        columns: ['name', 'author']
    },
    created: function () {
        this.fetchData();
    },
    methods: {
        sortBy : function(sortKey){
            this.reverse = (this.reverse == -1) ? 1 : -1 ;
            this.sortKey = sortKey;
        },
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
            var search = this.search
            return this.items.filter(function (item) {
                var name = item.attributes.name.toLowerCase().includes(search.toLowerCase());
                console.log(search)
                return name
            })
        },
        orderedUsers: function () {
            return _.orderBy(this.name, 'name')
        }
    }
})