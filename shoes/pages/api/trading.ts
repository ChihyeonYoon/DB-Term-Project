import type { NextApiRequest, NextApiResponse } from 'next'
import db from '../../connection'

export default async (req: NextApiRequest, res: NextApiResponse) => {
	const query = "SELECT Seller_name, Selling_product, Selling_price, image_file, Buyer_name, Buying_product , Buying_price from Seller join Shoes on Selling_product_number = model_number join Buyer on model_number = Buying_product_number;"
	
	try{
		const [rows, fields] = await db.execute(query)
		//console.log(rows)
		res.status(200).json(rows)
	} catch(err) {
		return res.status(500).json(err)
	}
	
}