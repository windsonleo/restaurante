package com.tecsoluction.restaurante.framework;

/**
 * Created by clebr on 21/07/2016.
 */
public abstract class AbstractEntitySearchOptions {
    private Integer startPosition;
    private Integer maxResults;

    public Integer getStartPosition() {
        return startPosition;
    }

    public void setStartPosition(Integer startPosition) {
        this.startPosition = startPosition;
    }

    public Integer getMaxResults() {
        return maxResults;
    }

    public void setMaxResults(Integer maxResults) {
        this.maxResults = maxResults;
    }
}
