package com.rems.voucher.general;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

@Repository
public interface GeneralVoucherRepository extends CrudRepository<GeneralVoucher, Integer> {

	@Override
    @Query
    public Iterable<GeneralVoucher> findAll();

	public Iterable<GeneralVoucher> findAllGeneralVouchersByParty(@Param("partyId")int partyId);
	
	/*
	 * Custom Query Example
	 * 
	@Query("from Auction a join a.category c where c.name=:categoryName")
	public Iterable<Receipt> findByCategory(@Param("categoryName") String categoryName);
	*/
}
