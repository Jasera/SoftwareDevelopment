package be.kdg.groepa.service.impl;

import be.kdg.groepa.helpers.CostManager;
import be.kdg.groepa.model.*;
import be.kdg.groepa.persistence.api.RouteDao;
import be.kdg.groepa.persistence.api.TrajectDao;
import be.kdg.groepa.persistence.api.UserDao;
import be.kdg.groepa.service.api.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Pieter-Jan on 18-2-14.
 */
@Service("RouteService")
public class RouteServiceImpl implements RouteService {

    @Autowired
    private RouteDao routeDao;

    @Autowired
    private TrajectDao trajectDao;

    @Autowired
    private UserDao userDao;

    @Override
    public void addRoute(Route r) {
        Traject t = new Traject(r.getAllPlaceTimes().get(0), r.getAllPlaceTimes().get(r.getAllPlaceTimes().size() - 1), r, r.getChauffeur());
        t.setRoute(r);
        r.addTraject(t);
        trajectDao.addTraject(t);
        r.getAllPlaceTimes().get(0).setRoute(r);
        r.getAllPlaceTimes().get(r.getAllPlaceTimes().size() - 1).setRoute(r);

        if (r.getWeekdayRoutes().size() > 0)
        {
            routeDao.addRepeatingRoute(r);
        }
        else routeDao.addNonRepeatingRoute(r);

        r.getChauffeur().addRoute(r);
        userDao.updateUser(r.getChauffeur());
    }

    @Override
    public void addPlace(Place p) {
        routeDao.addPlace(p);
    }

    @Override
    public void addPlaceTimeToPlace(PlaceTime pt, Place p) {
        routeDao.addPlaceTimeToPlace(pt, p);
    }

    @Override
    public void addPlaceTimeToRoute(Route r, PlaceTime pt) {
        routeDao.addPlaceTimeToRoute(r, pt);
    }

    @Override
    public void addWeekdayRoute(WeekdayRoute wr) {
        routeDao.addWeekdayRoute(wr);
    }

    @Override
    public void addRide(Ride r) {
        routeDao.addRide(r);
    }

    @Override
    public void confirmRide(Route r) {
        //Ride ride = new Ride(CostManager.calculateCost(r), CostManager.getTotalDistance(r));
        routeDao.confirmRide(r);
    }
    @Override
    public PlaceTime getPlaceTimeById(int id){
        return routeDao.getPlaceTimeById(id);
    }

    @Override
    public Route getRouteById(int routeId) {
        return routeDao.getRouteById(routeId);
    }
}


