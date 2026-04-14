package com.rainbowforest.Application.utilities;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import com.rainbowforest.Application.model.constructionSite.ConstructionSite;
import com.rainbowforest.Application.model.order.Order;

public class LiabilitiesUtilities {

	/**
	 * Sums all current financial liabilities for a given construction site 
	 * and saves the result to the map, where the key is the name of the construction site
	 * and the value is the sum of current liabilities
	 * 
	 * @param constructionSites, List of all construction site
	 * @param orders, List of all orders
	 * @return the map of current value of all liabilities for a given construction site
	 */
    public static Map<String, Double> getLiabilities(List<ConstructionSite> constructionSites, List<Order> orders) {
        Map<String, Double> liabilitiesMap = new TreeMap<>();

        // Null check inputs
        if (constructionSites == null || orders == null) {
            return liabilitiesMap; // Empty map
        }

        for (ConstructionSite cs : constructionSites) {  // Enhanced for loop
            if (cs == null || cs.getBuildingName() == null) continue;

            String csName = cs.getBuildingName();
            double liabilities = 0;

            for (Order order : orders) {
                if (order == null) continue;
                ConstructionSite orderCS = order.getConstructionSite();
                if (orderCS != null && csName.equals(orderCS.getBuildingName()) && order.getStatus() == 0) {
                    liabilities += order.getTotalPrice();
                }
            }
            liabilitiesMap.put(csName, liabilities);  // Safe now
        }
        return liabilitiesMap;
    }

}
