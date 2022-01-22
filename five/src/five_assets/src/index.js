import { five } from "../../declarations/five";

async function post() {
  let post_button = document.getElementById("post");
  post_button.disabled = true;
  let textarea = document.getElementById("message");
  let text = textarea.value;
  await five.post(text);
  post_button.disabled = false;
  
}

var num_posts = 0;
async function load_posts() {
  let posts_section = document.getElementById("posts");
  let posts = await five.posts();
  if (num_posts == posts.length) return;
  posts_section.replaceChildren([]);
  num_posts =posts.length;
  for (var i=0;i < posts.length; i++){
    let post = document.createElement("p")
    post.innerText = posts[i].art
    posts_section.appendChild(post)
  }
}
function load() {
  let post_button = document.getElementById("post");
  post_button.onclick = post;
  load_posts()
  setInterval(load_posts,3000)
}

window.onload = load