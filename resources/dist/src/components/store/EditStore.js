import React, { useEffect } from 'react';
import { connect } from 'react-redux';
import { useParams } from 'react-router-dom'
import { fetchStore } from '../../store/action/storeAction';
import StoreForm from './StoreForm';
import HeaderTitle from '../header/HeaderTitle';
import MasterLayout from '../MasterLayout';
import { getFormattedMessage } from '../../shared/sharedMethod';
import TopProgressBar from "../../shared/components/loaders/TopProgressBar";

const EditStore = ( props ) => {
    const { fetchStore, stores } = props;
    const { id } = useParams();

    useEffect( () => {
        fetchStore( id );
    }, [] );

    const itemsValue = stores && stores.length === 1 && stores.map( store => ( {
        name: store.attributes.name,
        phone: store.attributes.phone,
        address: store.attributes.address,
        location: store.attributes.location,
        created_at: store.attributes.created_at,
        id: store.id
    } ) );

    return (
        <MasterLayout>
            <TopProgressBar />
            <HeaderTitle title={getFormattedMessage( 'store.edit.title' )} to='/app/stores' />
            {stores.length === 1 && <StoreForm singleStore={itemsValue} id={id} />}
        </MasterLayout>
    )
};

const mapStateToProps = ( state ) => {
    const { stores } = state;
    return { stores }
};

export default connect( mapStateToProps, { fetchStore } )( EditStore );

