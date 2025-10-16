//alchemy websocket for price feed? idk i forgot why I need a ws 
import { WebSocket } from "npm:ws";
import nconf from "npm:nconf"

const ALCHEMY_WSS_ETH: string = `wss/${NETWORK[0]}`
const NETWORK = ['eth', 'opt', 'base']

