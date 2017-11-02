var mysql = require("mysql"),
    inquirer = require("inquirer");



// connect to the mysql server and sql database
db.connect(function(err) {
  if (err) throw err;
  start();
});

function start() {
  db.query("SELECT * FROM products", function(err, res) {
    if (err) throw err;
    for (var i in res) {
      console.log(`${res[i].item_id} || ${res[i].product_name} || $${res[i].price} || ${res[i].stock_quantity}`);
    }
    selectProduct();
  });
}

function selectProduct() {
      inquirer.prompt([
      {
        name: "choice",
        type: "input",
        message: "Which product would you like to purchase?"
      },
      {
        name: "quantity",
        type: "input",
        message: "How many of this item would you like?"
      }
    ])
    .then(function(answer) {
      db.query("SELECT * FROM products WHERE item_id = ?", [answer.choice],
      function(err, res) {
        if (err) throw err;
        var choice = parseInt(answer.choice),
            requestedQuantity = parseInt(answer.quantity),
            chosenItem;

            for (var i = 0; i < res.length; i++) {
              if (res[i].item_id === choice) {
                chosenItem = res[i];
              }
            }
            var itemId = chosenItem.item_id,
            product = chosenItem.product_name,
            currentStock = chosenItem.stock_quantity;

            if (choice <= itemId) {
              console.log("Found a match for " + product + "!");
              var updatedStock = currentStock - requestedQuantity;

              db.query("UPDATE products SET ? WHERE ?",
              [{stock_quantity: updatedStock}, {item_id: choice}],
              function(err, res) {
                console.log("Current amount: " + updatedStock);
              });

            } else {
              console.log("Insufficient quantity!");
            }
      })
    })
    .catch(function(rejection) {
      console.log("Reason for rejection " + rejection);
    });
}
