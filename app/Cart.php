<?php 

/* un produits que nous ajouitons au panier va represnter un item et items represente le panier qui contient plusieurs produits  */

/* public $totalQty = 0; quantité total de produit dans le panier   */



/* $item est un produit sélectionner dns la bd
 et $product_id est l'id du produit */ 
 /* add($item, $product_id ) equivaut à 
 $cart->add($produit, $id);
 $produit : prends tous les info d'un produits dans la BD 
 $id : est l'id d'un produit */ 

/* if($this->items) : si nous avons qqchose dans notre items */
/* if(array_key_exists($product_id, $this->items)){
si vous ce produit dns votre items  */

/* quand on click sur ajouter au panier alors  */ 
/* $storedItem['qty']++; : quantité unitaire de chaque produit  */ 

/* $this->items[$product_id] = $storedItem; : 
contient touts les info d'un produits */ 

/** $this->items[id]['qty'] : ancienne quantité
 * modifierqty($qty, $id) : nouvelle quantité
 */





namespace App;

class Cart{
     
    public $items = null;
    public $totalQty = 0;
    public $totalPrice = 0; 

    public function __construct($oldCart){
    // si nous avons qqchose alors dans le panier alors 
        if($oldCart){
            $this->items = $oldCart->items;
            $this->totalQty = $oldCart->totalQty;
            $this->totalPrice = $oldCart->totalPrice;
        }
    }
    
    public function add($item, $product_id){
/* $storedItem est un tableau qui prend les données d'un produit */        
        $storedItem = ['qty' => 0, 'product_id' => 0, 'product_name' => $item->product_name, 'product_price' => $item->product_price, 'product_image' => $item->product_image, 'item' => $item];


        if($this->items){
            if(array_key_exists($product_id, $this->items)){

                $storedItem = $this->items[$product_id];
            }
        }

        $storedItem['qty']++; 
        $storedItem['product_id'] = $product_id;
        $storedItem['product_name'] = $item->product_name;
        $storedItem['product_price'] = $item->product_price;
        $storedItem['product_image'] = $item->product_image;

     /* $this->totalQty++; : nbre total de produit dns le panier */
        $this->totalQty++;
        $this->totalPrice += $item->product_price;
        $this->items[$product_id] = $storedItem;
    }


public function updateQty($id, $qty){
    $this->totalQty -= $this->  items[$id]['qty'];
    $this->totalPrice -= $this->items[$id]['product_price']*$this->items[$id]['qty'];
    $this->items[$id]['qty'] = $qty;
    $this->totalQty += $qty;   
    $this->totalPrice += $this->items[$id]['product_price']*$qty;
}


public function removeItem($id){
    $this->totalQty -= $this->items[$id]['qty'];
    $this->totalPrice -= $this->items[$id]['product_price']*$this->items[$id]['qty'];
    unset($this->items[$id]);  
}


}

?>