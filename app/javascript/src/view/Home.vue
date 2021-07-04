<template>
    <div>
        <h3>English日記</h3>
        <label for="title">title</label><br>

        <input class="titletext"
          id="title" 
          type="text"
          v-model="title"
        >
        <br><br>
        <label class="label" for="content">コメント</label><br>
        <textarea class="contenttext"
          id="content"
          v-model="content"
        >
        </textarea>
        <br><br>
        <v-btn @click="createComment" class="createbtn">投稿</v-btn>
        <h2>掲示板</h2>
        
      <div>
        <div class="text-center d-flex pb-4">
          <v-btn @click="all">
            all
          </v-btn>
          <div>{{ panel }}</div>
          <v-btn @click="none">
            none
          </v-btn>
        </div>

        <v-expansion-panels
          v-model="panel" multiple
        >
          <v-expansion-panel
            v-for="post in reverseposts" :key="post.id"
          >
            <v-expansion-panel-header> 
              {{ post.title }}
            </v-expansion-panel-header>
            <v-expansion-panel-content>
              {{post.content}}
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
      </div>

        <div v-for="post in reverseposts" :key="post.id">
          <!-- <a :href="'/show/' + post.id ">{{ post.title }}</a> -->
        </div>
    </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      title: "",
      content: "",
      post: {},
      posts: [],
      inputData: {},
      panel: [],
    };
  }, 
  methods: {
    all() {
      this.panel = [...Array(this.posts.length).keys()].map((k, i) => i)
    },
    none() {
      this.panel = []
    },
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
  },



  // created() { 
  //     axios.get("http://127.0.0.1:3000/api/v1/posts/" + this.$route.params.id)
  //     .then(res => {
  //       this.post = res.data.data
  //       console.log('post is', this.post)
  //     })
  //     .catch(err => {
  //       console.log('error is ',err)
  //     })
  // }
  

};
</script>

<style>
/* #app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
} */

.titletext{
  width: 30%;
  color: black;
  border: solid;
  border-color:black;
}

.contenttext{
  width: 30%;
  height: 100px;
  border: solid;
  border-color:black;
}

/* .text-center d-flex pb-4{
  width: 50%;
} */

</style>
