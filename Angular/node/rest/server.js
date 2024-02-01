const express2 = require("express");
const cors = require("cors");

const app = express2();

app.use(cors());

const data = [
  {
    id: 1,
    title: "Angular for Beginners",
    desc: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Voluptatem, laudantium nostrum? Aperiam sint quis veniam accusamus, alias dolores dolorem, quasi quae eaque temporibus recusandae quisquam harum repudiandae earum eius ea!",
    photo:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Angular_full_color_logo.svg/2048px-Angular_full_color_logo.svg.png",
    price: 0,
  },
  {
    id: 2,
    title: "Angular Advanced",
    desc: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Voluptatem, laudantium nostrum? Aperiam sint quis veniam accusamus, alias dolores dolorem, quasi quae eaque temporibus recusandae quisquam harum repudiandae earum eius ea!",
    photo:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Angular_full_color_logo.svg/2048px-Angular_full_color_logo.svg.png",
    price: 100,
  },
  {
    id: 3,
    title: "Angular for Experts",
    desc: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Voluptatem, laudantium nostrum? Aperiam sint quis veniam accusamus, alias dolores dolorem, quasi quae eaque temporibus recusandae quisquam harum repudiandae earum eius ea!",
    photo:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Angular_full_color_logo.svg/2048px-Angular_full_color_logo.svg.png",
    price: 500,
  },
  {
    id: 4,
    title: "Angular for Professionals",
    desc: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Voluptatem, laudantium nostrum? Aperiam sint quis veniam accusamus, alias dolores dolorem, quasi quae eaque temporibus recusandae quisquam harum repudiandae earum eius ea!",
    photo:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Angular_full_color_logo.svg/2048px-Angular_full_color_logo.svg.png",
    price: 10000,
  },
];

app.get("/getdata", (req, res) => {
  res.json(data);
});

app.listen(3000, () => console.log("Server ready!"));
