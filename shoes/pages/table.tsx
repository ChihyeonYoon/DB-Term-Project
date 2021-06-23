import axios from 'axios'
import { useState, useEffect } from 'react'
export default function table() {
	return (
		<div>
			<ShoesHeader />
			<ShoesTable />
			<h2>Trading</h2>
			<TradingTable />
		</div>
	)
}

const ShoesHeader = () => {
	return <h1>Shoes Info</h1>
}

const ShoesTable = () => {
	const [ units, setUnits ] = useState([])
	
	const fetchShoes = async () => {
		try{
			const res = await axios.get('https://db-term-project-ebuqj.run.goorm.io/api/shoes')
			setUnits(res.data)
		} catch(err){
			console.log(err)
		}
	}
	useEffect(() => {
		fetchShoes()
	}, [])
	
	return(
		<table border="1">
			
				
			<tr>
				<th>Image</th>
				<th>Product Name</th>
				<th>Brand</th>
				<th>Model Number</th>
				<th>Color</th>
				<th>Release Date</th>
				<th>price</th>
			</tr>
			{units.map((unit, index) => 
			<tr key={index}>
				<td><img src ={`https://db-term-project-ebuqj.run.goorm.io/images/${unit.image_file}`} width = "100" height = "100" /></td>
				<td>{unit.product_name}</td>
				<td>{unit.brand}</td>
				<td>{unit.model_number}</td>
				<td>{unit.color}</td>
				<td>{unit.release_date}</td>
				<td>{unit.price}</td>
					
			</tr>
			)}
			
		</table>
	)
}

const TradingTable = () => {
	const [ units, setUnits ] = useState([])
	
	const fetchtrades = async () => {
		try{
			const res = await axios.get('https://db-term-project-ebuqj.run.goorm.io/api/trading')
			setUnits(res.data)
		} catch(err){
			console.log(err)
		}
	}
	useEffect(() => {
		fetchtrades()
	}, [])
	
	return(
		<table border="1">
			<tr>
				<th>판매자</th>
				<th>판매가격</th>
				
				<th>상품</th>
				<th>Image</th>
				
				<th>구매자</th>
				<th>구매가격</th>
			</tr>
			{units.map((unit, index) => 
			<tr key={index}>
						   
				<td>{unit.Seller_name}</td>
				<td>{unit.Selling_price}</td>
						   
				<td>{unit.Selling_product}</td>
				<td><img src ={`https://db-term-project-ebuqj.run.goorm.io/images/${unit.image_file}`} width = "100" height = "100" /></td>
						   
				<td>{unit.Buyer_name}</td>
				
				<td>{unit.Buying_price}</td>
					
			</tr>
			)}
			
		
		</table>
	)
} 

