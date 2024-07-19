import React from 'react';
import {connect} from 'react-redux';
import {useNavigate} from 'react-router-dom';
import MasterLayout from '../MasterLayout';
import {addStore} from '../../store/action/storeAction';
import StoreForm from './StoreForm';
import HeaderTitle from '../header/HeaderTitle';
import {Filters} from '../../constants';
import {getFormattedMessage} from '../../shared/sharedMethod';

const CreateStore = (props) => {
    const {addStore} = props;
    const navigate = useNavigate();

    const addStoreData = (formValue) => {
        addStore(formValue, navigate, Filters.OBJ);
    };

    return (
        <MasterLayout>
            <HeaderTitle title={getFormattedMessage('store.create.title')} to='/app/store'/>
            <StoreForm addStoreData={addStoreData}/>
        </MasterLayout>
    )
};

export default connect(null, {addStore})(CreateStore);
