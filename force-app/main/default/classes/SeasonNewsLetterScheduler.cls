/**
 * Created by bjohnson on 4/7/2022.
 */

global class SeasonNewsLetterScheduler implements Schedulable {

	global void execute( SchedulableContext sc ){
		SeasonService.issueNewsLetters( null );
	}
}