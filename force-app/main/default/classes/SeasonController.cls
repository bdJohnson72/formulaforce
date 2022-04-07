/**
 * Created by bjohnson on 4/7/2022.
 */

public with sharing class SeasonController {

	public SeasonController(ApexPages.StandardController stdController)
	{
	}

	public PageReference sendNewsletter(){
		SeasonService.issueNewsLetters(null);

		return null;
	}

}