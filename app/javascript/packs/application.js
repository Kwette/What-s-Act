import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

import {changeSessionMethod} from '../components/navbar';
import {scrollFunction} from '../components/topbutton';
import {topFunction} from '../components/topbutton';

// changeSessionMethod();
// scrollFunction();
// topFunction();

import "../plugins/flatpickr"
