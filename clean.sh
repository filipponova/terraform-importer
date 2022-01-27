#!/usr/bin/env bash


clean(){ 
    echo "Cleaning..."
    rm -rf .terraform generated main.tf
    echo "Cleaned!"
}

clean
