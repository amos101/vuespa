<template>
  <div class="title">
    <h3></h3>
    <p>{{post.title}}</p>
    <p>{{post.content}}</p>

    <!-- <p>{{ get.FormDate("post[content]", this.content) }}</p> -->
  </div>
</template>

<script>
import axios from "axios";

export default{
  data() {
    return{
      post: {}
    }
  },
  created() { 
    axios.get("http://127.0.0.1:3000/api/v1/posts/" + this.$route.params.id)
    .then(res => {
      this.post = res.data.data
      console.log('post is', this.post)
    })
    .catch(err => {
      console.log('error is ',err)
    })
  }
}
</script>