/**
 * Created by bjohnson on 4/7/2022.
 */

@IsTest
private class SeasonNewsletterScheduler_Tests {

	@IsTest
	static void testNewsletterScheduler(){
		// TODO: Test stub
		Test.startTest();
		System.schedule( 'NewsLettterSchedule', '0 0 0 3 9 ? 2022', new SeasonNewsletterScheduler() );
		Test.stopTest();
	}

}