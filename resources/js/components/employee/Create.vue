<template>

<div>

<div class="row">
    <router-link to="/employee" class="btn btn-primary">All Employee</router-link>
</div>

<div class="row justify-content-center">
      <div class="col-xl-12 col-lg-12 col-md-12">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Add Employee</h1>
                  </div>
                  <form class="user" @submit.prevent="employeeInsert" enctype="multipart/form-data">

                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                            <input type="text" class="form-control" id="exampleInputFirstName" placeholder="Enter Your Full Name"
                             v-model="form.name">
                             <!-- <small class="text-danger" v-if="errors.name"> {{ errors.name[0] }} </small> -->
                            </div>
                            <div class="col-md-6">
                               <input type="email" class="form-control" v-model="form.email"   placeholder="Enter Your Email">
                               <!-- <small class="text-danger" v-if="errors.email">{{errors.email[0]}}</small> -->
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                               <input type="text" class="form-control" v-model="form.address" id="exampleInputFirstName"  placeholder="Enter Address">
                               <!-- <small class="text-danger" v-if="errors.address">{{errors.address[0]}}</small> -->
                            </div>
                            <div class="col-md-6">
                               <input type="text" class="form-control" v-model="form.salary" id="exampleInputFirstName"  placeholder="Enter Your Salary">
                               <!-- <small class="text-danger" v-if="errors.salary">{{errors.salary[0]}}</small> -->
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                               <input type="date" class="form-control" v-model="form.joining_date" id="exampleInputFirstName"  placeholder="Enter Joining date">
                               <!-- <small class="text-danger" v-if="errors.joining_date">{{errors.joining_date[0]}}</small> -->
                            </div>
                            <div class="col-md-6">
                               <input type="text" class="form-control" v-model="form.nid" id="exampleInputFirstName"  placeholder="Enter Your Nid">
                               <!-- <small class="text-danger" v-if="errors.nid">{{errors.nid[0]}}</small> -->
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                               <input type="text" class="form-control" v-model="form.phone" id="exampleInputFirstName"  placeholder="Enter Your Phone Number">
                               <!-- <small class="text-danger" v-if="errors.phone">{{errors.phone[0]}}</small> -->

                            </div>
                           
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                               <input type="file" class="custom-file-input"   id="customFile" @change="onFileSelect">
                               <label for="customFile" class="custom-file-label">Choose File</label>

                               <!-- <small class="text-danger" v-if="errors.photo">{{errors.photo[0]}}</small> -->

                            </div>

                            <div class="col-md-6">
                                <img :src="form.photo" style="width:40px; height:40px;" alt="">
                            </div>
                           
                        </div>
                    </div>
                   

                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </div>
                    <hr>
                  
                  </form>
                  <hr>
                  
                  <div class="text-center">
                  </div>
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
import axios from 'axios';

export default {

 

  data(){
    return{
        form: {
            name: null,
            email: null,
            phone: null,
            address: null,
            salary: null,
            date: null,
            nid: null,
            joining_date: null,
            photo: null,
        },

        errors: []
      
    }
  },

  created(){
    if(!User.loggedIn()){
      this.$router.push({name: 'Login'});
    }
    console.log(this.form);

  },

  methods:{
    onFileSelect(event)
    {
        let file = event.target.files[0];
        if(file.size > 1048770)
        {
            
            Toast.fire({
            icon: "warning",
            title: "image size size must be less than 1 MB"
          });
        }else{
            let reader = new FileReader();
            reader.onload = event =>{
              this.form.photo = event.target.result 
              console.log(event.target.result);
            };
            reader.readAsDataURL(file);

        }

    },

    employeeInsert(){
      axios.post("/api/employee",this.form)
      .then(() =>{

        this.$router.push({name: 'Employee'});

           Toast.fire({
            icon: "success",
            title: "successfully done employee insert"
          });
      })

      .catch(error => this.errors = error.response.data.errors)

    },


  }


 

}

</script>