/**
 * Created by bjohnson on 4/7/2022.
 */

public with sharing class ContestantController {

	public ContestantController(ApexPages.StandardController standardController){}

	public PageReference awardPoints(){
		ContestantService.awardChampionshipPoints(null);
		return null;
	}

}