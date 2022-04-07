/**
 * Created by bjohnson on 4/7/2022.
 */

public with sharing class RaceController {

	public RaceController(ApexPages.StandardController stdController)
	{
	}

	public PageReference awardPoints(){
		RaceService.awardChampionshipPoints(null);

		return null;
	}

}