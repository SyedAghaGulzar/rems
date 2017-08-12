package com.rems.receipt;

import org.springframework.stereotype.Repository;
import org.springframework.data.repository.CrudRepository;;

@Repository
public interface ReceiptRepository extends CrudRepository<Receipt, Integer> {

	
}
