/**
 * 
 */

/*alert("i load");*/

function updateCart(){
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	
	if(cart == null || cart.length == 0){
		console.log("Cart is empty")
		$(".cart-items").html( ("0") );
		$(".card-body2").html("<h3>No items in cart!</h3>");
		
		$(".checkout-btn").addClass("disabled");
	}else{
		console.log(cart);
		$(".checkout-btn").removeClass("disabled");
		$(".cart-items").html(` (${cart.length}) `);
		let table=`
			<table class='table'>
				<thead class="head-light">
					<tr>
						<th>Item name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
					</tr>
					
				</thead>
		`;
		let tPrice=0;
		cart.map((item)=>{
			table+=`
				<tr>
					<td>${item.productName}</td>
					<td>${item.productPrice}</td>
					<td>${item.productQty}</td>
					<td>${item.productPrice*item.productQty}</td>
					<td><button class="btn btn-danger btn-sm" onclick="deleteFromCart(${item.productId})">Remove</button></td>
				</tr>
			`;
			tPrice+= item.productPrice*item.productQty;
		})
		table=table+
			`<tr><td  colspan="4" class="text-right font-weight-bold">Total Price: ${tPrice}</td></tr>
			</table>`;
		$(".card-body2").html(table);
	}
}

$(document).ready(updateCart());

function addToCart(pid, pname, pprice){
	let cart=localStorage.getItem("cart");
	if(cart==null || cart.length==0){
		let products=[];
		let product ={productId: pid, productName: pname, productQty: 1, productPrice: pprice };
		products.push(product);
		
		/*key-value pairs should be in string*/
		localStorage.setItem("cart",JSON.stringify(products));
	}else{
		let pcart=JSON.parse(cart);
		let oldProduct=pcart.find( (item)=>item.productId==pid);
		console.log("oldProduct is: "+oldProduct);
		if(oldProduct){
			oldProduct.productQty+=1;
			pcart.map((item)=>{
				if(item.productId==oldProduct.productId){
					item.productQty=oldProduct.productQty;
				}
			})
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("pqty inc");
		}
		else{
			let product ={productId: pid, productName: pname, productQty: 1, productPrice: pprice };
			pcart.push(product);
		
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("product added");
		}
	}
	updateCart();
}

function deleteFromCart(pid){
	let cart=JSON.parse(localStorage.getItem("cart"))
	let newcart=cart.filter((item)=> item.productId!=pid);
	
	localStorage.setItem("cart",JSON.stringify(newcart));
	updateCart();
}

function goToCheckout(){
	window.location="checkout.jsp";
}