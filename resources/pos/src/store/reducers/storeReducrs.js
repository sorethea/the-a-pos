import {storeActionType} from '../../constants';

export default (state = [], action) => {
    switch (action.type) {
        case storeActionType.FETCH_STORES:
            return action.payload;
        case storeActionType.FETCH_STORE:
            return [action.payload];
        case storeActionType.ADD_STORE:
            return action.payload;
        case storeActionType.EDIT_STORE:
            return state.map(item => item.id === +action.payload.id ? action.payload : item);
        case storeActionType.DELETE_STORE:
            return state.filter(item => item.id !== action.payload);
        case storeActionType.FETCH_ALL_STORES:
            return action.payload;
        default:
            return state;
    }
};
