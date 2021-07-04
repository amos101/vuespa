<template>
  
  <div id="app">
    <nav>
      <router-link to="/"></router-link><br>
    </nav>
    <router-view></router-view>  
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      title: "",
      content: "",
      posts: [],
      inputData: {},
    };
  },

  methods: {
    createComment(){
      let formData = new FormData();
      formData.append("post[content]", this.content);
      formData.append("post[title]", this.title);
      console.log('formData is', formData)
      axios.post(
          'http://localhost:3000/api/v1/posts',
          formData,
        )
        .then(response =>{
          console.log(response);
          this.posts.push(response.data.data)
        })
        .catch(error =>{
          console.log(error);
        });
    }

    
  },
  mounted: function(){
     axios.get("http://127.0.0.1:3000/api/v1/posts/")
      .then(res => {
        this.posts = res.data.data
      })
      .catch(err => {
        console.log(err)
      })
  },
  computed: {
    // 配列の要素順番を逆順にする
    reverseposts() {
        return this.posts.slice().reverse();
    },
  }

  

};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}




</style>
