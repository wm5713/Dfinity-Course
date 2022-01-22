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
    post.innerText = posts[i].author + posts[i].time + posts[i].art
    posts_section.appendChild(post)
  }
}

var num_followed = 0;
async function followed() {
  let followed_section = document.getElementById("follow");
  let follows = await five.follows();
  if (num_followed == follows.length) return;
  followed_section.replaceChildren([]);
  num_followed =follows.length;
  for (var i=0;i < follows.length; i++){
    let follow = document.createElement("p")
    follow.innerText = follows[i]
    followed_section.appendChild(follow)
  }
}

var num_timeline = 0;
async function timeline() {
  let timeline_section = document.getElementById("timeline");
  let timeline = await five.timeline();
  if (num_timeline == timeline.length) return;
  timeline_section.replaceChildren([]);
  num_timeline =timeline.length;
  for (var i=0;i < timeline.length; i++){
    let s = document.createElement("p")
    s.innerText = "timeline: " + timeline[i].author + " " + timeline[i].time + " "+ timeline[i].art
    timeline_section.appendChild(s)
  }
}

function load() {
  let post_button = document.getElementById("post");
  post_button.onclick = post;
  load_posts()
  setInterval(load_posts,3000)
  followed()
  setInterval(followed,3000)
  timeline()
  setInterval(followed,3000)
}

window.onload = load