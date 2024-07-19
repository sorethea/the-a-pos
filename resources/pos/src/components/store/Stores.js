import React, { useState } from 'react';
import { connect } from 'react-redux';
import moment from 'moment';
import { useNavigate } from 'react-router-dom';
import MasterLayout from '../MasterLayout';
import { fetchStores } from '../../store/action/storeAction';
import ReactDataTable from '../../shared/table/ReactDataTable';
import DeleteWarehouse from './DeleteStore';
import TabTitle from '../../shared/tab-title/TabTitle';
import { getFormattedDate, getFormattedMessage, placeholderText } from '../../shared/sharedMethod';
import ActionButton from '../../shared/action-buttons/ActionButton';
import TopProgressBar from "../../shared/components/loaders/TopProgressBar";

const Stores = (props ) => {
    const { fetchStores, stores, totalRecord, isLoading, allConfigData } = props;
    const [ deleteModel, setDeleteModel ] = useState( false );
    const [ isDelete, setIsDelete ] = useState( null );
    const navigate = useNavigate();

    const onClickDeleteModel = ( isDelete = null ) => {
        setDeleteModel( !deleteModel );
        setIsDelete( isDelete );
    };

    const onChange = ( filter ) => {
        fetchStores( filter, true );
    };

    const goToEditProduct = ( item ) => {
        const id = item.id
        navigate( `/app/store/edit/${id}` )
    };

    const goToProductDetailPage = ( id ) => {
        navigate( `/app/store/detail/${id}` )
    };
    const itemsValue = stores.length >= 0 && stores.map( store => ( {
        date: getFormattedDate( store.attributes.created_at, allConfigData && allConfigData ),
        time: moment( store.attributes.created_at ).format( 'LT' ),
        name: store.attributes.name,
        phone: store.attributes.phone,
        address: store.attributes.address,
        id: store.id
    } ) );

    const columns = [
        {
            name: getFormattedMessage( 'globally.detail.store' ),
            selector: row => row.name,
            sortField: 'name',
            sortable: true,
            cell: row => {
                return <div>
                    <div className='text-primary'>{row.name}</div>
                </div>
            }
        },
        {
            name: getFormattedMessage( 'globally.input.phone-number.label' ),
            selector: row => row.phone,
            sortField: 'phone',
            sortable: true,
            cell: row => {
                return <div>
                    <div className='text-primary'>{row.phone}</div>
                </div>
            }
        },
        {
            name: getFormattedMessage( 'globally.input.address.label' ),
            selector: row => row.address,
            sortField: 'address',
            sortable: true,
            cell: row => {
                return <div>
                    <div className='text-primary'>{row.address}</div>
                </div>
            }
        },
        {
            name: getFormattedMessage( 'globally.react-table.column.created-date.label' ),
            selector: row => row.date,
            sortField: 'created_at',
            sortable: true,
            cell: row => {
                return (
                    <span className='badge bg-light-info'>
                        <div className='mb-1'>{row.time}</div>
                        {row.date}
                    </span>
                )
            }

        },
        {
            name: getFormattedMessage( 'react-data-table.action.column.label' ),
            right: true,
            ignoreRowClick: true,
            allowOverflow: true,
            button: true,
            cell: row => <ActionButton isViewIcon={true} item={row} goToDetailScreen={goToProductDetailPage}
                goToEditProduct={goToEditProduct} isEditMode={true}
                onClickDeleteModel={onClickDeleteModel} />
        }
    ];

    return (

        <MasterLayout>
            <TopProgressBar />
            <TabTitle title={placeholderText( 'stores.title' )} />
            <ReactDataTable columns={columns} items={itemsValue} onChange={onChange} isLoading={isLoading}
                ButtonValue={getFormattedMessage( 'store.create.title' )} totalRows={totalRecord}
                to='#/app/store/create' />
            <DeleteWarehouse onClickDeleteModel={onClickDeleteModel} deleteModel={deleteModel} onDelete={isDelete} />
        </MasterLayout>
    )
};

const mapStateToProps = ( state ) => {
    const { stores, totalRecord, isLoading, allConfigData } = state;
    return { stores, totalRecord, isLoading, allConfigData }
};

export default connect( mapStateToProps, { fetchStores } )( Stores );

