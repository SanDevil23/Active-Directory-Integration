package com.anand.ifc.rcm;

import org.slf4j.LoggerFactory;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.anand.ifc.rcm.M_Plant;
import com.anand.ifc.rcm.M_Plant_Dao;
import com.anand.ifc.rcm.M_Rcm;
import com.anand.ifc.rcm.M_Rcm_Dao;
import com.anand.ifc.rcm.M_Transaction;
import com.anand.ifc.rcm.M_Transaction_Dao;


@Configuration
@EnableScheduling
public class Scheduler {
	
	@Autowired private M_Transaction_Dao mTransactionDao;
	@Autowired private M_Rcm_Dao mRcmDao;
	@Autowired private M_Plant_Dao mPlantDao;
	
	private static final Logger logger = LoggerFactory.getLogger(Scheduler.class);
	
	//cron="second minute hour dayOfMonth month dayOfWeek";
	
	//trigger to fire every day at a given time(15:16)
	@Scheduled(cron="0 55 7 * * *")
	public void everyDay()throws Exception{
		//Calculating the last day of each month to set the validity date
		Date today = new Date();  
        Calendar calendar = Calendar.getInstance();  
        calendar.setTime(today);  
        calendar.add(Calendar.MONTH, 1);  
        calendar.set(Calendar.DAY_OF_MONTH, 1);  
        calendar.add(Calendar.DATE, -1);  
        Date lastDayOfMonth = calendar.getTime();  
        DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        
		List<M_Rcm> rcmList=mRcmDao.findAll();
		for(M_Rcm rcm: rcmList)
		{
			if(rcm.getRcmStatus() != null && rcm.getRcmStatus()==1) {
				List<M_Plant> plantList = mPlantDao.findByPlantForRcm(rcm);
				for(M_Plant plant: plantList)
				{
					if(plant.getPlantActive()==1) {
						M_Transaction txn=new M_Transaction();
						txn.setControlReference(rcm);
						txn.setPlantReference(plant);
						txn.setLineManager(plant.getLineManager());
						txn.setSohBy(plant.getSohBy());
						if(plant.getPraac()!=null) {
							txn.setPraac(plant.getPraac());
						}
						txn.setValidity(sdf.parse(sdf.format(lastDayOfMonth)));
						txn.setTransactionActive(1);
					    txn.setCreatedOn(sdf.parse(sdf.format(new Date())));
						mTransactionDao.save(txn);
						System.out.println("Done");
						txn=null;
					}
				}
			}
		}
		logger.info("First CRON job : {}",new Date());
	}
	//trigger to fire on every first day of the month at a given time(11:40 AM)
	@Scheduled(cron="0 40 11 1 * *")
	public void everyFirstDayOfMonth(){
		logger.info("Second CRON job : {}",new Date());
	}
	//trigger to fire on 15th of January at a given time(11:40 AM)
	@Scheduled(cron="0 40 11 15 1 *")
	public void fifteenthOfParticularMonth(){
		logger.info("Third CRON job : {}",new Date());
	}
	//trigger to fire on every Monday at a given time(11:40 AM)
	@Scheduled(cron="0 40 11 * * MON")
	public void everyMonday(){
		logger.info("Fourth CRON job : {}",new Date());
	}

}
