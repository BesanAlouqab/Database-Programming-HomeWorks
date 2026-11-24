1.1
SELECT customer_id , count(order_id) AS Num_Of_Orders
FROM Orders 
GROUP BY Customer_id;

1.2
SELECT C.name 
FROM Customer AS C JOIN Orders AS O 
ON C.Customer_id=O.costomer_id
GROUP BY C.Customer_id ,C.name
having COUNT(O.order_id)>(SELECT AVG(order_count)
                          FROM (SELECT COUNT(order_id)AS order_count
                                 FROM Orders 
                                 GROUP BY customer_id) AS T ));

1.3
create index idx_customer
ON Orders(Customer_id);

1.4
BEGIN 
INSERT INTO Orders 
VALUES(1,100,SYSDATE,115.00);
INSERT INTO Order_Items
VALUES(1,1,'Perfume',1,95.00);
INSERT INTO Order_Items
VALUES(2,1,'hair mist',1,20.00);
COMMIT;
EXCEPTION
 WHEN Others THEN
ROLLBACK;
END;

1.5
Atomicity:Every transaction will be excuted with all its parts or Rolledback it can't be seperated.
Consistency:Every transaction keeps the DB correct and consistent before and after its excution.
Isolation:Every transaction works indepndantly from other transacstios and won't be effected by uncommitted changes bu other users.
Durability:Once the commit is excuted , it will be saved in the DB even in case of power failure;


2.1
SELECT day, qty, SUM(qty) 
OVER(Order by day) As CumQty
From demand;

  
