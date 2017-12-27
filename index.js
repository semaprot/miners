var _ = require('lodash');

const XMR_STAT_URL = 'http://api.minexmr.com:8080/get_wid_stats?address=4AF4HTbwQ3d9SbdKNUsPU39HTuLwEMtcY3mmTwtufSPPDbqBsUSsskq7tXDfNDZ8bj6T3Wyv9yY2xcH8FN2i36ZjD2RW4e6';
const COUTION_OUTWORK_TIME = 30;

var axios = require('axios');
require('promise.prototype.finally').shim();

var fs = require('fs');
var data = fs.readFileSync('minersList');
var minersIP = data.toString().split('\n');

let minutesLater = new Date();
minutesLater.setMinutes(minutesLater.getMinutes() - COUTION_OUTWORK_TIME);

let minutesLaterTimestamp = _.round(new Date(minutesLater).getTime() / 1000, 0);

axios
  .get(XMR_STAT_URL)
  .then(function (response) {
    response.data.forEach((miner) => {
      if(parseInt(miner.lastShare) < minutesLaterTimestamp) {
        minersIP.forEach((minerIP, i) => {
          if(minerIP.indexOf(miner.address.split('.')[1]) !== -1) {
            console.log(minersIP[i + 1].split(' ')[2]);
          }
        })
      }
    })
    return response;
  })
  .finally(function () {
    // console.log('this will always be called');
  });
