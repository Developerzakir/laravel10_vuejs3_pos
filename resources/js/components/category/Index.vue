<template>

<div>

<div class="row">
    <router-link to="/store-category" class="btn btn-primary">Add Category</router-link>
</div><br>
<input type="text" class="form-control" v-model="searchTerm" style="width:300px;" placeholder="Search Here..">

<div class="row justify-content-center">
      <div class="col-xl-12 col-lg-12 col-md-12">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
          <div class="row">
            <div class="col-lg-12 mb-4">
              <!-- Simple Tables -->
              <div class="card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Category Lists</h6>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>Category Name</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="category in filterSearch" :key="category.id">
                        <td><a href="#">{{category.category_name}}</a></td> 
                        <td>
                          <router-link :to="{name: 'editCategory', params:{id:category.id} }" class="btn btn-sm btn-primary">Edit</router-link>
                          <a href="#" @click="categoryDelete(category.id)" class="btn btn-sm btn-danger">Delete</a>
                        </td>
                      </tr>
                      
                    </tbody>
                  </table>
                </div>
                <div class="card-footer"></div>
              </div>
            </div>
          </div>
          </div>
        </div>
      </div>
    </div>
</div>

</template>

<script type="text/javascript">


export default {

  created(){
    if(!User.loggedIn()){
      this.$router.push({name: 'Login'});
    };

    this.allCategory();

  },

  data(){
    return{
      categories: [],
      searchTerm: ''
    }
  },

  computed:{
    filterSearch()
    {
      const searchTermLower = this.searchTerm.toLowerCase(); 
      return this.categories.filter(category =>{
        return category.category_name.toLowerCase().includes(searchTermLower);
      })
    }

  },


  methods:{
    allCategory(){
      axios.get('/api/category')
      .then(({data}) => (this.categories = data))
      .catch()
    },

    categoryDelete(id){
          Swal.fire({
          title: "Are you sure?",
          text: "You won't be able to revert this!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes, delete it!"
        }).then((result) => {
          if (result.isConfirmed) {
            axios.delete('/api/category/'+id)
            .then(()=>{
              this.categories = this.categories.filter(category =>{
                return category.id != id
              })
            })
            .catch(()=>{
              this.$router.push({name: 'Category'})
            })

            Swal.fire({
              title: "Deleted!",
              text: "Your file has been deleted.",
              icon: "success"
            });
          }
        });
    }
   
  }


 

}

</script>

<style type="text/css">
  #em_photo{
    width:80px;
    height:80px;
  }

</style>