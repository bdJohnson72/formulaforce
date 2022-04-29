/**
 * Created by brooks.johnson on 4/29/2022.
 */

public interface IServiceDesk {
    List<Case> startEntitlementProcess(Case cs);
    List<Case> stopEntitlementProcess(Case cs);
}